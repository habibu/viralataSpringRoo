package com.roo.viralatas.web;
import com.roo.viralatas.domain.Acompanhamentos;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/acompanhamentoses")
@Controller
@RooWebScaffold(path = "acompanhamentoses", formBackingObject = Acompanhamentos.class)
public class AcompanhamentosController {
}
