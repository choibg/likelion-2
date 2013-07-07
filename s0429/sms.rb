#encoding: utf-8
#require 'digest/md5'
#require 'soap/wsdlDriver'
require 'savon'

#sms send information
SMS_USER = 'birdsil'
SMS_PASSWORD = 'qjemtlf'

#client = SOAP::WSDLDriverFactory.new('http://webservice.tongkni.co.kr/sms.2/ServiceSMS.asmx?WSDL').create_rpc_driver
client = Savon.client(wsdl: 'http://lmsservice.tongkni.co.kr/lms.1/ServiceLMS.asmx?WSDL')

h = Hash.new
h["receivePhone"] ="01045269891"
hash_value = Digest::MD5.hexdigest(SMS_USER+SMS_PASSWORD+h["receivePhone"])
h["hashValue"] = hash_value
h["lmsID"] = SMS_USER
h["senderPhone"] ="01045269891"
h["lmsContent"] ="hello"
h["lmsTitle"] = "hello"

res = client.call(:send_lms, :message => h)
if res.body[:send_lms_response][:send_lms_result] != "1" #error
  puts "FAIL"
else
  puts "SUCCESS"
end
