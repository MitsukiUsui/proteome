import xml.etree.ElementTree as ET
import sys

def output(param_dct):
    print("PrecursorMassTolerance..."+param_dct['PrecursorMassTolerance'])
    print("IsotopeErrorRange..."+param_dct['MinIsotopeError']+','+param_dct['MaxIsotopeError'])
    print("FragmentMethod..."+param_dct['FragmentMethod'])
    print("Instrument..."+param_dct["Instrument"])
    print("Enzyme..."+param_dct['Enzyme']['id'])
    print("Protocol..."+param_dct['Protocol'])
    print("Number of Tolerable Termini..."+param_dct['NumTolerableTermini'])
    print("modification..."+param_dct['Modifications'])
    print("MaxNumModifications..."+param_dct["MaxNumModifications"])
    print("MinPepLength..."+param_dct['MinPepLength'])
    print("MaxPepLength..."+param_dct['MaxPepLength'])
    print("MinCharge..."+param_dct['MinCharge'])
    print("MaxCharge..."+param_dct['MaxCharge'])
    print("NumMatchesPerSpec..."+param_dct['NumMatchesPerSpec'])

def main(filename):
    with open(filename,'r') as f:
        XmlData=f.read()
    root = ET.fromstring(XmlData)
        
    SpectrumIdentificationProtocol=root[4][0]
    assert SpectrumIdentificationProtocol.tag=='{http://psidev.info/psi/pi/mzIdentML/1.1}SpectrumIdentificationProtocol'
    param_dct={}

    #additionalSearchParams section
    AdditionalSearchParams=SpectrumIdentificationProtocol[1]
    assert AdditionalSearchParams.tag=='{http://psidev.info/psi/pi/mzIdentML/1.1}AdditionalSearchParams'
    for child in AdditionalSearchParams:
        try:
            param_dct[child.attrib['name']]=child.attrib['value']
        except KeyError:
            pass

    #ModificationParams section
    ModificationParams=SpectrumIdentificationProtocol[2]
    assert ModificationParams.tag=='{http://psidev.info/psi/pi/mzIdentML/1.1}ModificationParams'
    s=''
    for child in ModificationParams:
        s+='residues:'+child.attrib['residues']+', massDelta:'+child.attrib['massDelta']+', fixedMode:'+child.attrib['fixedMod']+'\t'
    param_dct['Modifications']=s

    #Enzymes section
    Enzymes=SpectrumIdentificationProtocol[3]
    assert Enzymes.tag=='{http://psidev.info/psi/pi/mzIdentML/1.1}Enzymes'
    assert len(Enzymes)==1
    Enzyme=Enzymes[0]
    param_dct["Enzyme"]=Enzyme.attrib

    #ParentTolerance section
    ParentTolerance=SpectrumIdentificationProtocol[4]
    assert ParentTolerance.tag=='{http://psidev.info/psi/pi/mzIdentML/1.1}ParentTolerance'
    param_dct['PrecursorMassTolerance']=ParentTolerance[0].attrib['value']+' '+\
                                        ParentTolerance[0].attrib['unitName']+', '+\
                                        ParentTolerance[1].attrib['value']+' '+\
                                        ParentTolerance[1].attrib['unitName']

    #Threshold section
    Threshold=SpectrumIdentificationProtocol[5]
    assert Threshold.tag=='{http://psidev.info/psi/pi/mzIdentML/1.1}Threshold'
    
    output(param_dct)
    
    
if __name__=="__main__":
    main(sys.argv[1])
