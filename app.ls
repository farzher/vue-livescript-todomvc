app = new Vue do
  el:'#todoapp'
  data:
    title:'', activeFilter:'all'
    all:JSON.parse localStorage.getItem \v or []
  ready:-> @$watch 'all' (-> localStorage.v = JSON.stringify it), true
  computed:
    active:-> @all |> _.reject (.completed)
    completed:-> @all |> _.filter (.completed)
    allDone:
      get:-> @active.length is 0
      set:(v)-> @all |> _.each (.completed = v)
  methods:
    create:-> if @title.trim! => @all.push {title:that, -completed, -oldTitle}; @title = ''
    cancel:-> it.title = it.oldTitle; it.oldTitle = ''
    save:-> it.oldTitle = ''; if !it.title.trim! => @all.$remove it
    removeCompleted:-> @all |>= _.reject (.completed)

Router {'*':-> app.activeFilter = it} .init '/all'
