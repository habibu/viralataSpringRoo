// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.roo.viralatas.web;

import com.roo.viralatas.domain.Cidades;
import com.roo.viralatas.domain.Enderecos;
import com.roo.viralatas.domain.Moradias;
import com.roo.viralatas.domain.Usuarios;
import com.roo.viralatas.web.EnderecosController;
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

privileged aspect EnderecosController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String EnderecosController.create(@Valid Enderecos enderecos, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, enderecos);
            return "enderecoses/create";
        }
        uiModel.asMap().clear();
        enderecos.persist();
        return "redirect:/enderecoses/" + encodeUrlPathSegment(enderecos.getIdEndereco().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String EnderecosController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Enderecos());
        return "enderecoses/create";
    }
    
    @RequestMapping(value = "/{idEndereco}", produces = "text/html")
    public String EnderecosController.show(@PathVariable("idEndereco") Integer idEndereco, Model uiModel) {
        uiModel.addAttribute("enderecos", Enderecos.findEnderecos(idEndereco));
        uiModel.addAttribute("itemId", idEndereco);
        return "enderecoses/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String EnderecosController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("enderecoses", Enderecos.findEnderecosEntries(firstResult, sizeNo));
            float nrOfPages = (float) Enderecos.countEnderecoses() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("enderecoses", Enderecos.findAllEnderecoses());
        }
        return "enderecoses/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String EnderecosController.update(@Valid Enderecos enderecos, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, enderecos);
            return "enderecoses/update";
        }
        uiModel.asMap().clear();
        enderecos.merge();
        return "redirect:/enderecoses/" + encodeUrlPathSegment(enderecos.getIdEndereco().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{idEndereco}", params = "form", produces = "text/html")
    public String EnderecosController.updateForm(@PathVariable("idEndereco") Integer idEndereco, Model uiModel) {
        populateEditForm(uiModel, Enderecos.findEnderecos(idEndereco));
        return "enderecoses/update";
    }
    
    @RequestMapping(value = "/{idEndereco}", method = RequestMethod.DELETE, produces = "text/html")
    public String EnderecosController.delete(@PathVariable("idEndereco") Integer idEndereco, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Enderecos enderecos = Enderecos.findEnderecos(idEndereco);
        enderecos.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/enderecoses";
    }
    
    void EnderecosController.populateEditForm(Model uiModel, Enderecos enderecos) {
        uiModel.addAttribute("enderecos", enderecos);
        uiModel.addAttribute("cidadeses", Cidades.findAllCidadeses());
        uiModel.addAttribute("moradiases", Moradias.findAllMoradiases());
        uiModel.addAttribute("usuarioses", Usuarios.findAllUsuarioses());
    }
    
    String EnderecosController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
