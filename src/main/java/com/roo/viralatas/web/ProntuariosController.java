package com.roo.viralatas.web;
import com.roo.viralatas.domain.Prontuarios;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/prontuarioses")
@Controller
@RooWebScaffold(path = "prontuarioses", formBackingObject = Prontuarios.class)
public class ProntuariosController {
}
