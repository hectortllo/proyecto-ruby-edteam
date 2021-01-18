require './src/manager.rb'
require './src/archive.rb'
require 'bcrypt'
require 'io/console'
require 'byebug'

class Login
  def initialize
    @user_info = []
    @username, @password = '', ''
    @file = Archive.new
    @manager = Manager.new
  end

  def user_exist?
    if (!@file.file_exists?('./dist/user.txt'))
      new_user
      @file.write_file(@username, @password)
    else
      @user_info = @file.read_file
      @user_info.each do |credential|
        credential.gsub!("\n", "")
      end

      current_user
      @manager.menu
    end
  end

  def new_user
    puts "Ingrese su nombre de usuario: "
    @username = gets.chomp
    puts "Ingrese su contraseña: "
    @password = BCrypt::Password
                .create(STDIN.noecho(&:gets).chomp)
  end

  def current_user
    found = false
    while(!found)
      puts "Ingrese su usuario: "
      @username = gets.chomp
      puts "Ingrese su contraseña: "
      @password = STDIN.noecho(&:gets).chomp
      if (@username == @user_info[0] &&
          BCrypt::Password.new(@user_info[1]) == @password)
        puts "Bienvenido #{@username}"
        found = true
      else
        puts "Credenciales incorrectas"
      end

    end
  end
end