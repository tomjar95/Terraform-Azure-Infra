# Terraform Azure Lab

Ten projekt Terraform tworzy prosty środowiskowy lab w Azure z zasobami sieciowymi oraz dwoma maszynami wirtualnymi Linux.

## Co jest tworzone

- grupę zasobów
- sieć wirtualną z dwoma subnetami: subnet0 i subnet1
- dwie maszyny wirtualne Windows:
  - az900-1 w subnet0
  - az900-2 w subnet1

## Struktura projektu

- [prod](prod) — konfiguracja dla środowiska prod
- [modules/resource_group](modules/resource_group) — moduł tworzący grupę zasobów
- [modules/vnet](modules/vnet) — moduł tworzący VNet i subnety
- [modules/vm](modules/vm) — moduł tworzący VM

## Wymagania

- Terraform >= 1.0
- Azure CLI
- aktywne konto Azure i subskrypcja
- zalogowany użytkownik Azure CLI:

```bash
az login
```

## Konfiguracja

1. Przejdź do katalogu [prod](prod).
2. Skopiuj plik [prod/terraform.tfvars.example](prod/terraform.tfvars.example) do [prod/terraform.tfvars](prod/terraform.tfvars).
3. Uzupełnij wartości, zwłaszcza:
   - subscription_id
   - location
   - owner

Przykład:

```hcl
subscription_id = "00000000-0000-0000-0000-000000000000"
location        = "westeurope"
owner           = "TwojeImie"
```

## Uruchomienie

```bash
cd prod
terraform init
terraform plan
terraform apply
```

## Outputy

Po zastosowaniu konfiguracji Terraform wypisze nazwy VM oraz hasła użytkownika administracyjnego. Hasła są oznaczone jako wrażliwe.


## Zniszczenie zasobów

```bash
cd prod
terraform destroy
```
