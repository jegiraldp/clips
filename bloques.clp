;;Regla apilar
(defrule apilar ?cog<-(cogido ?b1) ?lib<-(libre ?b2)
=> (assert(sobre ?b2 ?b1)(libre ?b1)) (retract ?lib) (retract ?cog)
(printout t " Apilado " ?b1 " sobre " ?b2 crlf) 
)

;;Regla desapilar
(defrule desapilar ?sob<-(sobre ?b2 ?b1) ?man<-(manolibre) (libre ?b1)
=> (assert(libre ?b2)(retract ?sob))
(printout t " Desapilado " ?b1 " de " ?b2 crlf)
)


;;;;;;;;;;;;;;Hechos
(assert (sobre B C))
(assert (sobre C A))
(assert (libre A))
(assert (manolibre))