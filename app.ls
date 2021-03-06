app = new Vue do
  el:'#todoapp'
  data:{name:'', activeFilter:'all', all:JSON.parse localStorage.getItem \v or []}
  ready:-> @$watch 'all' (-> localStorage.v = JSON.stringify it), {+deep}
  computed:
    completed:-> @all |> _.filter (.completed)
    active:-> @all |> _.reject (.completed)
    allDone:
      get:-> @active.length is 0
      set:(v)-> @all |> _.each (.completed = v)
  methods:
    create:-> if @name => @all.push {@name, -completed, -oldName}; @name = ''
    cancel:-> it.name = it.oldName; it.oldName = ''
    save:-> it.oldName = ''; if !it.name.trim! => @all.$remove it
    removeCompleted:-> @all |>= _.reject (.completed)

Router {'*':-> app.activeFilter = it} .init '/all'
