package com.roo.viralatas.web;
import com.roo.viralatas.domain.Animais;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/animaises")
@Controller
@RooWebScaffold(path = "animaises", formBackingObject = Animais.class)
public class AnimaisController {
}
