good_driving_record = false
age = 24

p good_driving_record && age > 25 ? "Discount" : good_driving_record || age > 25 ? "Full Price" : "Need a co-signer"
