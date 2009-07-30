class AddThesisPaperColumns < ActiveRecord::Migration
	def self.up
		add_column :theses, :paper_file_name,    :string
		add_column :theses, :paper_content_type, :string
		add_column :theses, :paper_file_size,    :integer
		add_column :theses, :paper_updated_at,   :datetime
	end

	def self.down
		remove_column :theses, :paper_file_name
		remove_column :theses, :paper_content_type
		remove_column :theses, :paper_file_size
		remove_column :theses, :paper_updated_at
	end
end