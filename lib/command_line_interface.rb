require 'pry'
class CommandLineInterface

  def fireworks
puts <<-'EOF'
                                  .''.
        .''.             *''*    :_\/_:     .
       :_\/_:   .    .:.*_\/_*   : /\ :  .'.:.'.
   .''.: /\ : _\(/_  ':'* /\ *  : '..'.  -=:o:=-
  :_\/_:'.:::. /)\*''*  .|.* '.\'/.'_\(/_'.':'.'
  : /\ : :::::  '*_\/_* | |  -= o =- /)\    '  *
   '..'  ':::'   * /\ * |'|  .'/.\'.  '._____
       *        __*..* |  |     :      |.   |' .---"|
        _*   .-'   '-. |  |     .--'|  ||   | _|    |
     .-'|  _.|  |    ||   '-__  |   |  |    ||      |
     |' | |.    |    ||       | |   |  |    ||      |
  ___|  '-'     '    ""       '-'   '-.'    '`      |____
  jgs~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
EOF
  end

  def show2019
puts <<-'EOF'
                                        ,---.-,
      ,----,     ,----..        ,---,  '   ,'  '.
    .'   .' \   /   /   \    ,`--.' | /   /      \
  ,----,'    | /   .     :  /    /  :.   ;  ,/.  :
  |    :  .  ;.   /   ;.  \:    |.' ''   |  | :  ;
  ;    |.'  /.   ;   /  ` ;`----':  |'   |  ./   :
  `----'/  ; ;   |  ; \ ; |   '   ' ;|   :       ,
    /  ;  /  |   :  | ; | '   |   | | \   \      |
   ;  /  /-, .   |  ' ' ' :   '   : ;  `---`---  ;
  /  /  /.`| '   ;  \; /  |   |   | '     |   |  |
./__;      :  \   \  ',  /    '   : |     '   :  ;
|   :    .'    ;   :    /     ;   |.'     |   |  '
;   | .'        \   \ .'      '---'       ;   |.'
`---'            `---`                    '---'

EOF
  end

  def greet
    puts "Welcome to 2019!!!!!🎉🏮🎇🎆2️⃣ 0  ️⃣1️ ⃣9️ ⃣👶🏽"
  end


  def home
    puts "Type 'add' to add resolution"
    puts "Type 'search' to search resolutions by category"
    puts "Type 'all' to see all resolutions"
    puts "Type 'exit' to exit"
    input = gets.chomp
    if input == "add"
      addresolution
    elsif input == "search"
      search_by_category
    elsif input == "all"
      allresolutions
    elsif input == "exit"
      puts "Have a happy new year!!"
    elsif input == "fireworks"
      fireworks
      home
    elsif input == "2019"
      show2019
      home
    else
      puts "invalid input, try again"
      home
    end
  end


  def addresolution
    puts "What is your resolution for 2019?"
    resolution = gets.chomp
    puts "Enter categories for this resolution seperated by commas"
    categories = gets.chomp

    new_resolution = Resolution.find_or_create_by(content: resolution)

    category_array = categories.split(',')
    category_array.each do |c|
      c = Category.find_or_create_by(name: c)
      new_resolution.categories << c
    end
  end


  def search_by_category

  end


  def allresolutions
    resolutions = Resolution.all
    puts "\nResolutions for 2019: \n"
    i = 1
    resolutions.each do |r|
      puts "#{i.to_s}.  #{r.content}"
      i += 1
      #puts "  categories: #{r.categories.name}"
    end
  end










  def run
    fireworks
    show2019
    greet
    binding.pry
    home
  end

end
