from beings.contactform import Contactform

def test_init():
    contactform = Contactform("Alex", "alex@gmail.com")
    assert contactform.name == "Alex"