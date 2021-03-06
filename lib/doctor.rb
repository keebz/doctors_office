require 'pry'
require 'table_butler'

class Doctor < Table_Butler

attr_accessor:name, :area_id, :id, :ins_id

  def add_patient(patient)
    DB.exec("INSERT INTO patients_doctors (patient_id, doctor_id) VALUES ('#{patient.id}', '#{@id}');")
  end

  def list_patients
    patients = []
    results = DB.exec("SELECT * FROM patients_doctors WHERE doctor_id = '#{@id}';")
    results.each do |result|
      patient_id = result["patient_id"].to_i
      pat_results = DB.exec("SELECT * FROM patients WHERE id = #{patient_id};")
      pat_results.each do |patient|
        patient_name = patient['name']
        patient_birthday = patient['birthday'].split(" ")[0]
        new_patient = Patient.new({'name' => patient_name, 'birthday' => patient_birthday, 'id' => patient_id})
        patients << new_patient
      end
    end
    patients
  end
end



