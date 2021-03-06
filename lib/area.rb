require 'table_butler'

class Area < Table_Butler

  attr_accessor:name, :id

  def doctors
    doctors = []
    results = DB.exec("SELECT * FROM doctors WHERE area_id = ('#{@id}')")
    results.each do |result|
      doctor_name = result['name']
      doctor_ins_id = result['ins_id'].to_i
      doctor_area_id = result['area_id'].to_i
      doctor_id = result['id'].to_i
      current_doctor = Doctor.new({'name' => doctor_name, 'area_id' => doctor_area_id, 'ins_id' => doctor_ins_id, 'id' => doctor_id})
      doctors << current_doctor
    end
    doctors
  end

end
