;;Sistema Experto Médico


;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Regla desfribilacion urgente
(defrule desfribilacion_urgente
(riesgo ?nombre infarto) (anterior ?nombre infarto)
=> 
(assert (aplicar ?nombre desfribilacion_urgente))
(printout t "dar a " ?nombre " desfribilacion urgente." crlf)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Regla riesgo infarto

(defrule riesgo_infarto 
(dolor ?nombre lado_izquierdo) (alta ?nombre presion_alterial)
=>
(assert (riesgo ?nombre infarto))
(printout t ?nombre " corre riesgo infarto" crlf)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Regla Presión alterial alta 
(defrule presion_alterial_alta 
(alta ?nombre presion_ocular)
=>
(assert (alta ?nombre presion_alterial))
(printout t ?nombre " tiene la presión alterial alta" crlf)
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Regla Esclerótico
(defrule esclerotico 
(paciente ?nombre sobrepeso fumador)
=>
(assert (propenso ?nombre esclerosis))
(printout t ?nombre " es propenso a la esclerosis" crlf)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Regla desfribilacion general
(defrule desfribilacion_general
(propenso ?nombre esclerosis) 
(alta ?nombre presion_ocular)
=> 
(assert (aplicar ?nombre desfribilacion_general))
(printout t "dar a " ?nombre " desfribilacion general." crlf)
)



;;;;;;;;;;;;;;;;;;;Hechos

(deffacts inicio

(alta Jose-Martinez presion_ocular)
(anterior Jose-Martinez infarto)
(dolor Jose-Martinez lado_izquierdo)
(paciente Jose-Martinez sobrepeso fumador))

