package com.roo.viralatas.web;
import com.roo.viralatas.domain.PossiveisLocais;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/possiveislocaises")
@Controller
@RooWebScaffold(path = "possiveislocaises", formBackingObject = PossiveisLocais.class)
public class PossiveisLocaisController {
}
