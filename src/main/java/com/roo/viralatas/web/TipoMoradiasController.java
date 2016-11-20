package com.roo.viralatas.web;
import com.roo.viralatas.domain.TipoMoradias;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/tipomoradiases")
@Controller
@RooWebScaffold(path = "tipomoradiases", formBackingObject = TipoMoradias.class)
public class TipoMoradiasController {
}
