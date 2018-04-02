require 'roo'

contacts_data = ""
xlsx = Roo::Spreadsheet.open('./projet contacts dinca 2.ods')
p xlsx.count
xlsx.each do |ligne|
      if ligne[1]
        contacts_data = contacts_data  + "BEGIN:VCARD\r\n" +
                        "VERSION:2.1\r\n" +
                        "N:#{ligne[1]};;;\r\n" +
                        "FN:#{ligne[1]}\r\n" +
                        "TEL;CELL:#{ligne[2]}\r\n" +
                        "TEL;HOME:#{ligne[3]}\r\n" +
                        "END:VCARD\r\n"
      end
end

contacts_file = File.open("ALL_CONTACTS.vcf","w")
contacts_file.write(contacts_data)
p contacts_data.length




# BEGIN:VCARD
# VERSION:2.1
# N:Doe;John;;;
# FN:John Doe
# ORG:Doe Company, The;
# TITLE: President
# NOTE;ENCODING=QUOTED-PRINTABLE: This is a note associated with this
# contact=0D=0A
# TEL;WORK;VOICE:(987) 123-4567
# TEL;HOME;VOICE:(987) 765-4321
# TEL;CELL;VOICE:(987) 135-8642
# TEL;WORK;FAX:(987) 246-1357
# ADR;WORK:;;1234 North Street;Anytown;TX 751234;;United States of America
# LABEL;WORK;ENCODING=QUOTED-PRINTABLE:1234 North Street=0D=0AAnytown, TX
# 751234 =0D=0AUnited States of America
# URL:
# URL:<WWLINK TYPE="GENERIC"
# VALUE="http://www.doeweb.com">http://www.doeweb.com</WWLINK>
# EMAIL;PREF;INTERNET:jdoe@nowhere.com
# REV:19980114T170559Z
# END:VCARD
