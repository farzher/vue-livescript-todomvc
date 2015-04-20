app = new Vue do
  el: '#todoapp'
  data:
    title: '', activeFilter: 'all'
    all: JSON.parse localStorage.getItem \v or []
  ready: -> @$watch 'all' (-> localStorage.v = JSON.stringify it), true
  computed:
    active: -> _.reject (.completed), @all
    completed: -> _.filter (.completed), @all
    allDone:
      get: -> @active.length is 0
      set: (v) -> _.each (.completed = v), @all
  methods:
    create: -> if @title.trim! => @all.push {title: that, -completed, -oldTitle}; @title = ''
    remove: -> @all.$remove it.$data
    cancel: -> it.title = it.oldTitle; it.oldTitle = ''
    save: -> it.oldTitle = ''; if !it.title.trim! => @remove it
    removeCompleted: -> @all = _.reject (.completed), @all

r = Router {'*': -> app.activeFilter = it} .init '/all'
