namespace :doc do
  namespace :diagram do
    task :models do
      sh "railroad -i -l -a -m -M | dot -Tsvg | sed 's/font-size:9.00/font-size:7.00/g' > doc/models.svg"
    end

    task :controllers do
      sh "railroad -i -l -C | neato -Tsvg | sed 's/font-size:9.00/font-size:7.00/g' > doc/controllers.svg"
    end
		
		task :aasm do
      sh "railroad -i -l -A | neato -Tsvg | sed 's/font-size:9.00/font-size:7.00/g' > doc/aasm.svg"
    end
  end

  task :diagrams => %w(diagram:models diagram:controllers diagram:aasm)
end