Paperclip.interpolates :login do |attachment, style|
  attachment.instance.login
end

Paperclip.interpolates :folder_id do |attachment, style|
	attachment.instance.folder_id
end

Paperclip.interpolates :hashed_id do |attachment, style|
  Digest::MD5.hexdigest(attachment.instance.id.to_s + 'AC8M6bZmf2:\gp6!U_/R')
end