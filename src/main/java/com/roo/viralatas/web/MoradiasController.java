package com.roo.viralatas.web;
import com.roo.viralatas.domain.Moradias;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/moradiases")
@Controller
@RooWebScaffold(path = "moradiases", formBackingObject = Moradias.class)
public class MoradiasController {
}
