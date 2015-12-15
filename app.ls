app = new Vue do
  el:'#todoapp'
  data:{name:'', activeFilter:'all', all:JSON.parse localStorage.getItem \v or []}
  ready:-> @$watch 'all' (-> localStorage.v = JSON.stringify it), {+deep}
  computed:
    active:-> @all |> _.reject (.completed)
    completed:-> @all |> _.filter (.completed)
    allDone:
      get:-> @active.length is 0
      set:(v)-> @all |> _.each (.completed = v)
  methods:
    create:-> if @name.trim! => @all.push {name:that, -completed, -oldName}; @name = ''
    cancel:-> it.name = it.oldName; it.oldName = ''
    save:-> it.oldName = ''; if !it.name.trim! => @all.$remove it
    removeCompleted:-> @all |>= _.reject (.completed)

Router {'*':-> app.activeFilter = it} .init '/all'
