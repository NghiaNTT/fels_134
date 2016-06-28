module CreateActivity
  def create_activity user_id, targer_id, action_type
    Activity.create user_id: user_id, targer_id: targer_id,
      action_type: action_type
  end
end
