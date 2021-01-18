require './src/task.rb'
require './src/archive.rb'

class Manager
  $manager = []

  def initialize
    @task = Task.new
    @archive = Archive.new
    # $manager = @archive.read_file_tasks
  end

  def initialize_file
    if (!@archive.file_exists?('./dist/tasks.txt'))
      $manager = ''
      @archive.create_file_tasks
    else
      $manager = @archive.read_file_tasks
    end
  end

  def create_task
    puts "Nombre de la tarea: "
    _name = gets.chomp
    @task.create(_name, 0)
    @archive.write_file_tasks
    gets
  end

  def get_tasks
    puts @task.show
    gets
  end

  def menu
    op = 0
    while (op != 10)
      system 'clear'
			puts "1. Crear tarea"
			puts "2. Listar todas las tareas"
			puts "3. Buscar tarea por nombre"
			puts "4. Editar tarea"
			puts "5. Marcar como en proceso"
			puts "6. Marcar como terminada"
			puts "7. Ver todas las tareas creadas"
			puts "8. Ver todas las tareas en proceso"
			puts "9. Ver todas las tareas finalizadas"
      puts "10. Salir"
      op = gets.to_i
      case op
        when 1
          system 'clear'
          create_task
        when 2
          system 'clear'
          get_tasks
      end
    end
  end

end