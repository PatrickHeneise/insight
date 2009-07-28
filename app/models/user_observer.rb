class UserObserver < ActiveRecord::Observer
  def after_create(user)
    Notifier.deliver_system_registration(user)
  end
end