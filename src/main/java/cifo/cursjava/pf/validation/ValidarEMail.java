package cifo.cursjava.pf.validation;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class ValidarEMail implements ConstraintValidator<EMail, String> {
	
	@Override
	public void initialize(EMail email) {}
	
	@Override
	public boolean isValid(String email, ConstraintValidatorContext cxt) {
		Pattern pat = Pattern.compile("/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\\.[a-zA-Z0-9-]+)*$/");
		Matcher mat = pat.matcher(email);
		
		return mat.matches();
	}
}
