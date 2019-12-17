package cifo.cursjava.pf.validation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

@Constraint(validatedBy = ValidarEMail.class)
@Target({ ElementType.METHOD, ElementType.FIELD })
@Retention(RetentionPolicy.RUNTIME)
public @interface EMail {
	String message() default "Has d'introdïr una adreça de correu electrònic vàlida";
	Class<?>[] groups() default {};
	Class<? extends Payload>[] payload() default {};
}