class Task
  @name = ''
  @state = ''
  @task = {
    name: '',
    state: ''
  }

  def create(name, state)
    @name = name
    @state = state
    @task = {
      name: @name,
      state: @state
    }

    $manager.append(@task)
  end

  def show
    $manager
  end

end