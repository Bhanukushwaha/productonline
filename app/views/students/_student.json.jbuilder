json.extract! student, :id, :first_name, :last_name, :string, :email, :mobile_no, :date, :image, :address, :status, :created_at, :updated_at
json.url student_url(student, format: :json)
