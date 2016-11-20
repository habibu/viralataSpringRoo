// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.roo.viralatas.web;

import com.roo.viralatas.domain.Adotantes;
import com.roo.viralatas.domain.Moradias;
import com.roo.viralatas.domain.Usuarios;
import com.roo.viralatas.web.AdotantesController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect AdotantesController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String AdotantesController.create(@Valid Adotantes adotantes, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, adotantes);
            return "adotanteses/create";
        }
        uiModel.asMap().clear();
        adotantes.persist();
        return "redirect:/adotanteses/" + encodeUrlPathSegment(adotantes.getIdAdotante().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String AdotantesController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Adotantes());
        return "adotanteses/create";
    }
    
    @RequestMapping(value = "/{idAdotante}", produces = "text/html")
    public String AdotantesController.show(@PathVariable("idAdotante") Integer idAdotante, Model uiModel) {
        uiModel.addAttribute("adotantes", Adotantes.findAdotantes(idAdotante));
        uiModel.addAttribute("itemId", idAdotante);
        return "adotanteses/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String AdotantesController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("adotanteses", Adotantes.findAdotantesEntries(firstResult, sizeNo));
            float nrOfPages = (float) Adotantes.countAdotanteses() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("adotanteses", Adotantes.findAllAdotanteses());
        }
        return "adotanteses/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String AdotantesController.update(@Valid Adotantes adotantes, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, adotantes);
            return "adotanteses/update";
        }
        uiModel.asMap().clear();
        adotantes.merge();
        return "redirect:/adotanteses/" + encodeUrlPathSegment(adotantes.getIdAdotante().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{idAdotante}", params = "form", produces = "text/html")
    public String AdotantesController.updateForm(@PathVariable("idAdotante") Integer idAdotante, Model uiModel) {
        populateEditForm(uiModel, Adotantes.findAdotantes(idAdotante));
        return "adotanteses/update";
    }
    
    @RequestMapping(value = "/{idAdotante}", method = RequestMethod.DELETE, produces = "text/html")
    public String AdotantesController.delete(@PathVariable("idAdotante") Integer idAdotante, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Adotantes adotantes = Adotantes.findAdotantes(idAdotante);
        adotantes.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/adotanteses";
    }
    
    void AdotantesController.populateEditForm(Model uiModel, Adotantes adotantes) {
        uiModel.addAttribute("adotantes", adotantes);
        uiModel.addAttribute("moradiases", Moradias.findAllMoradiases());
        uiModel.addAttribute("usuarioses", Usuarios.findAllUsuarioses());
    }
    
    String AdotantesController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}