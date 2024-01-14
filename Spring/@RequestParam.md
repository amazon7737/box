# @RequestParam
> 쿼리 매개변수를 컨트롤러의 메서드 인수에 바인딩 할 수 있습니다.

```java

@Controller
@RequestMapping("/pets")
public class EditPetForm{

  // ...

  @GetMapping
  public String setupForm(@RequestParam("petId") int petId, Model model){


    Pet pet = this.clinic.loadPet(petId);
    model.addAttribute("pet" , pet);
    return "petForm";

  }

  // ...

}

```

URL: localhost:8080/detail?petId=Cat


