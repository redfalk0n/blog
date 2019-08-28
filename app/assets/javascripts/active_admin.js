//= require active_admin/base
//= require activeadmin/medium_editor/medium_editor
//= require activeadmin/medium_editor_input
//= require action_cable
//= require jquery-toast-plugin
$(document).ready(() => {
  const path = document.URL.split('/')
  const id = path[path.indexOf('posts') + 1]
  if (path.indexOf('posts') !== -1 && path.indexOf('edit') !== -1 && $.isNumeric(id)) {
    const cable = ActionCable.createConsumer('ws://localhost:3000/cable')
    let justReceived = false
    let newMember = true
    const sub = cable.subscriptions.create({channel: 'PostsChannel', id},{
      received(data) {
        if (data.message && data.message === 'Share data') {
          if ( newMember ) { newMember = false }
          else {
            sub.send({title: $('#post-title')[0].value})
            sub.send({subheader: $('#post-subheader')[0].value})
            sub.send({content: $('.medium-editor')[0].innerHTML})
            sub.send({author: $('#post-author')[0].value})
          }
          return
        }
        const type = Object.keys(data)[0]
        const toastConfig = {
          heading: 'Обратите внимание!',
          icon: 'info',
          loader: false,
          loaderBg: '#9EC600',
          hideAfter: 3000,
          showHideTransition: 'slide'
        }
        if (type === 'content' && $('.medium-editor')[0].innerHTML !== data.content && !delays.contentDelay) {
          $('.medium-editor')[0].innerHTML = data.content
          justReceived = true
          toastConfig.text = 'Тело новости сейчас редактируется'
          $.toast(toastConfig)
        } else if((type === 'title' || type === 'subheader' || type === 'author')
          && $(`#post-${type}`)[0].value !== data[`${type}`] && !delays[`${type}Delay`]) {
          $(`#post-${type}`)[0].value = data[`${type}`]
          toastConfig.text = `${type === 'title' ? 'Заголовок' : type === 'subheader' ? 'Подзаголовок' : 'Автор'} сейчас редактируется`
          $.toast(toastConfig)
        }
      }
    });
    $('#post-title').on('input', (e) => {
      delayManager('title', e)
    })
    $('#post-subheader').on('input', (e) => {
     delayManager('subheader', e)
    })
    const observer = new MutationObserver( function() {
      if (justReceived) {
        justReceived = false
      } else {
        delayManager('content')
      }
    })
    observer.observe($('.medium-editor')[0], {
      characterData: true,
      childList: true,
      attributes: true,
      subtree: true,
      attributeOldValue: true
    })
    $('#post-author').on('input', (e) => {
      delayManager('author', e)
    })

    const delays = {
      titleDelay: false,
      titleChanges: false,
      subheaderDelay: false,
      subheaderChanges: false,
      contentDelay: false,
      contentChanges: false,
      authorDelay: false,
      authorChanges: false,
    }
    function delayManager(type, data) {
      const opts = {}
      if (type === 'content') {
        opts[`${type}`] = $('.medium-editor')[0].innerHTML
      } else {
        opts[`${type}`] = data.currentTarget.value
      }
      if (!delays[`${type}Delay`]) {
        sub.send(opts)
        delays[`${type}Delay`] = true
        setTimeout(() => {
          delays[`${type}Delay`] = false
          if (delays[`${type}Changes`]) {
            delays[`${type}Changes`] = false
            delayManager(type, data)
          }
        }, 3000)
      } else {
        delays[`${type}Changes`] = true
      }
    }
  }
})
