#!/home/mitsuki/.pyenv/versions/anaconda3-4.2.0/bin/python

import xml.etree.ElementTree as ET
import sys

def parse_asp(additionalSearchParams):
    for child in additionalSearchParams:
        try:
            print(child.attrib['name']+':'+child.attrib['value'])
        except KeyError:
            pass

def parse_mop(modificationParams):
    s=""
    for child in modificationParams:
        s+=child.attrib["residues"]+'/'+child.attrib["massDelta"]+'/'+child.attrib["fixedMod"]+','
    if s!="":
        s=s[:-1]
    print("Modification:"+s)
    
def parse_enz(enzymes):
    s=""
    for child in enzymes:
        s+=child.attrib["id"]+','
    if s!="":
        s=s[:-1]
    print("Enzymes:"+s)

def parse_pto(parentTolerance):
    for child in parentTolerance:
        print(child.attrib["name"]+":"+child.attrib["value"]+" "+child.attrib["unitName"])


def main(filepath):
    #filepath="test/Arthro_001-LTQFT1_28Sep05_Andro_0705-06_msgfplus.mzid"
    with open(filepath,'r') as f:
        XmlData=f.read()
    root = ET.fromstring(XmlData)
    sip=root.find('.//{http://psidev.info/psi/pi/mzIdentML/1.1}SpectrumIdentificationProtocol')
    
    asp=sip.find("{http://psidev.info/psi/pi/mzIdentML/1.1}AdditionalSearchParams")
    parse_asp(asp)
    mop=sip.find("{http://psidev.info/psi/pi/mzIdentML/1.1}ModificationParams")
    parse_mop(mop)
    enz=sip.find("{http://psidev.info/psi/pi/mzIdentML/1.1}Enzymes")
    parse_enz(enz)
    pto=sip.find("{http://psidev.info/psi/pi/mzIdentML/1.1}ParentTolerance")
    parse_pto(pto)
    
if __name__=="__main__":
    main(sys.argv[1])
