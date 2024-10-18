class User < ApplicationRecord
  devise :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :two_factor_authenticatable,
         :two_factor_backupable,
         otp_secret_encryption_key: ENV['OTP_SECRET_ENCRYPTION_KEY'],
         otp_number_of_backup_codes: 10
  has_one_attached :image
  belongs_to :staff
  before_validation :assign_staff

  def assign_staff
    # Split the full_name to get firstname and lastname
    if self.full_name.present?
      name_parts = self.full_name.split(" ", 2)
      firstname = name_parts[0]
      lastname = name_parts[1] || ""

      # Prüfe, ob es bereits einen Staff mit demselben Vor- und Nachnamen gibt
      existing_staff = Staff.find_by(firstname: firstname, lastname: lastname)

      if existing_staff
        # Falls ein Staff mit gleichem Namen existiert, verknüpfe ihn mit dem User
        self.staff = existing_staff
      else
        # Falls kein passender Staff existiert, erstelle einen neuen und befülle die zusätzlichen Felder
        self.staff ||= Staff.create(
          firstname: firstname,
          lastname: lastname,
          email: self.email,         # E-Mail des Users
          address: self.address,     # Falls vorhanden, Adresse des Users
          phone_no: self.phone_no,   # Falls vorhanden, Telefonnummer des Users
          role: self.role,           # Falls der User eine Rolle hat
          salary: 0.0                # Standardwert für das Gehalt, falls erforderlich
        )
      end
    else
      Rails.logger.error "Kein vollständiger Name für den Benutzer vorhanden."
    end
  end


  # Enum for Department
  enum department: { marketing: 0, sales: 1, hr: 2, development: 3}
end
