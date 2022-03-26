#Your CAMS \+ KFintech summary has been sent to your registered email id (.+) Your reference number is (.+).
#Your CAMS \+ KFintech summary has been sent to your registered email id example@example.com Your reference number is 12312931289312.
m = "Your CAMS + KFintech summary has been sent to your registered email id example@example.com Your reference number is 12312931289312.".match /Your CAMS \+ KFintech summary has been sent to your registered email id (.+) Your reference number is (.+)./
puts m[2]