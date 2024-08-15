# Домашнее задание к занятию «Основы Terraform. Yandex Cloud» Шарапат Виктор

### Цели задания

1. Создать свои ресурсы в облаке Yandex Cloud с помощью Terraform.
2. Освоить работу с переменными Terraform.


### Чек-лист готовности к домашнему заданию

1. Зарегистрирован аккаунт в Yandex Cloud. Использован промокод на грант.
2. Установлен инструмент Yandex CLI.
3. Исходный код для выполнения задания расположен в директории [**02/src**](https://github.com/netology-code/ter-homeworks/tree/main/02/src).


### Задание 0

1. Ознакомьтесь с [документацией к security-groups в Yandex Cloud](https://cloud.yandex.ru/docs/vpc/concepts/security-groups?from=int-console-help-center-or-nav). 
Этот функционал понадобится к следующей лекции.

------
### Внимание!! Обязательно предоставляем на проверку получившийся код в виде ссылки на ваш github-репозиторий!
------

### Задание 1
В качестве ответа всегда полностью прикладывайте ваш terraform-код в git.
Убедитесь что ваша версия **Terraform** ~>1.8.4

1. Изучите проект. В файле variables.tf объявлены переменные для Yandex provider.
2. Создайте сервисный аккаунт и ключ. [service_account_key_file](https://terraform-provider.yandexcloud.net).
4. Сгенерируйте новый или используйте свой текущий ssh-ключ. Запишите его открытую(public) часть в переменную **vms_ssh_public_root_key**.
5. Инициализируйте проект, выполните код. Исправьте намеренно допущенные синтаксические ошибки. Ищите внимательно, посимвольно. Ответьте, в чём заключается их суть.
6. Подключитесь к консоли ВМ через ssh и выполните команду ``` curl ifconfig.me```.
Примечание: К OS ubuntu "out of a box, те из коробки" необходимо подключаться под пользователем ubuntu: ```"ssh ubuntu@vm_ip_address"```. Предварительно убедитесь, что ваш ключ добавлен в ssh-агент: ```eval $(ssh-agent) && ssh-add``` Вы познакомитесь с тем как при создании ВМ создать своего пользователя в блоке metadata в следующей лекции.;
8. Ответьте, как в процессе обучения могут пригодиться параметры ```preemptible = true``` и ```core_fraction=5``` в параметрах ВМ.

В качестве решения приложите:

- скриншот ЛК Yandex Cloud с созданной ВМ, где видно внешний ip-адрес;
- скриншот консоли, curl должен отобразить тот же внешний ip-адрес;
- ответы на вопросы.

### Решение 1

* Создал сервисный акаунт(authorized_key.json), сгенерировал ssh ключ.

![image](https://github.com/user-attachments/assets/d63274fa-1edb-446f-886b-f254226591f3)

* Инициализировал проект, выполните код, исправил ошибки

Oшибка в синтаксисе main.tf (17) platform_id = "standart-v4" и версия v4 нет в Yandex.Cloud

Исправлено на platform_id = "standard-v1"


Ошибка в версии terraform в файле providers.tf  required_version = ">=1.5"

Исправлено: required_version = ">=1.8.4"


Ошибка allowed core number: 2, 4. Минимальная конфигурация в Yandex.Cloud CPU =2

![image](https://github.com/user-attachments/assets/2f8a0f45-7f03-40a3-91d3-9f5048b488ea)

![image](https://github.com/user-attachments/assets/54fd2b87-7cea-4129-993f-7e5ad749e20a)

* Из официальной документации Yandex.Cloud

![image](https://github.com/user-attachments/assets/70a4bfb0-8dc7-473c-b305-77390124b655)

![image](https://github.com/user-attachments/assets/206f4429-33f6-4e2a-8fc8-4a7dcc30ff0f)


* Исправленный код

![image](https://github.com/user-attachments/assets/caf1fcb1-3f73-4bb4-b419-6713a938bea7)


* terraform apply

![image](https://github.com/user-attachments/assets/baea5273-732d-45d5-99eb-861ca99c6bd2)

* Создалась VM

![image](https://github.com/user-attachments/assets/c8a395cf-556e-40d8-9907-bf171dc632b4)

* Подключение по ssh и выполнение команды
![image](https://github.com/user-attachments/assets/1caec939-fc38-4016-ba96-cbfad2c56a4c)

* Ответьте, как в процессе обучения могут пригодиться параметры ```preemptible = true``` и ```core_fraction=5``` в параметрах ВМ.

preemptible = true 

Прерываемые виртуальные машины — это виртуальные машины, которые могут быть принудительно остановлены в любой момент. Это может произойти в двух случаях:

 - Если с момента запуска виртуальной машины прошло 24 часа.
 - Если возникнет нехватка ресурсов для запуска обычной виртуальной машины в той же зоне доступности. Вероятность такого события низкая, но может меняться изо дня в день.

core_fraction=5 - означает, что вы используется только 5% производительности CPU.

Эти параметры помогут в процессе обучения сэкономить ресурсы и бюджет. А так, как в процессе обучения не с первого раза все получается и можно забыть выполнить terraform destroy, лучше создавать VM с этими параметрами.  

----------

### Задание 2

1. Замените все хардкод-**значения** для ресурсов **yandex_compute_image** и **yandex_compute_instance** на **отдельные** переменные. К названиям переменных ВМ добавьте в начало префикс **vm_web_** .  Пример: **vm_web_name**.
2. Объявите нужные переменные в файле variables.tf, обязательно указывайте тип переменной. Заполните их **default** прежними значениями из main.tf. 
3. Проверьте terraform plan. Изменений быть не должно. 

### Решение 2

![image](https://github.com/user-attachments/assets/0442d1f2-6fc3-436e-8af8-bdffcc658ae3)

![image](https://github.com/user-attachments/assets/40231520-259e-411b-b177-a75d7e1f167c)

![image](https://github.com/user-attachments/assets/7d68f7fd-80de-415b-8570-074dff2baa17)

-------

### Задание 3

1. Создайте в корне проекта файл 'vms_platform.tf' . Перенесите в него все переменные первой ВМ.
2. Скопируйте блок ресурса и создайте с его помощью вторую ВМ в файле main.tf: **"netology-develop-platform-db"** ,  ```cores  = 2, memory = 2, core_fraction = 20```. Объявите её переменные с префиксом **vm_db_** в том же файле ('vms_platform.tf').  ВМ должна работать в зоне "ru-central1-b"
3. Примените изменения.

### Решение 3
* Создал файл vms_platform.tf. Перенес в него переменные VM1 и указал переменые для VM2

![image](https://github.com/user-attachments/assets/3cc87d94-8888-4adf-97b2-9912cb6a7e40)

* В файле main.tf прописал вторую VM2 с указанием зоны "ru-central1-b"
* т.к. ВМ2 вдругой зоне (отличной от зоны по умолчанию, пришлось добавлять подсеть зоны B).

![image](https://github.com/user-attachments/assets/eb167a08-ce81-4dc5-9fe7-cc44e79983c6)

![image](https://github.com/user-attachments/assets/fc2fa30e-6ba3-490e-bbed-a9dff9c6d3ad)

* Команда terraform plan показала измениения (создание VM2)

 ![image](https://github.com/user-attachments/assets/b3a1086d-94cd-4b5e-96a5-3691528684c5)

* Выполнил terraform apply (создалась вторая ВМ)

![image](https://github.com/user-attachments/assets/6d79bb1a-e0cd-4adf-bfc0-cb27aaeedf96)

 
--------

### Задание 4

1. Объявите в файле outputs.tf **один** output , содержащий: instance_name, external_ip, fqdn для каждой из ВМ в удобном лично для вас формате.(без хардкода!!!)
2. Примените изменения.

В качестве решения приложите вывод значений ip-адресов команды ```terraform output```.


### Решение 4

* Добавил в файл outputs.tf

![image](https://github.com/user-attachments/assets/be12cc60-d40e-45db-abfe-a15e5d5e2b7f)

* вывод terraform output

![image](https://github.com/user-attachments/assets/e0c5d574-c987-4b88-bb24-d0fe4d55d6fb)

-----

### Задание 5

1. В файле locals.tf опишите в **одном** local-блоке имя каждой ВМ, используйте интерполяцию ${..} с НЕСКОЛЬКИМИ переменными по примеру из лекции.
2. Замените переменные внутри ресурса ВМ на созданные вами local-переменные.
3. Примените изменения.

### Решение 5



-----

### Задание 6

1. Вместо использования трёх переменных  ".._cores",".._memory",".._core_fraction" в блоке  resources {...}, объедините их в единую map-переменную **vms_resources** и  внутри неё конфиги обеих ВМ в виде вложенного map(object).  
   ```
   пример из terraform.tfvars:
   vms_resources = {
     web={
       cores=2
       memory=2
       core_fraction=5
       hdd_size=10
       hdd_type="network-hdd"
       ...
     },
     db= {
       cores=2
       memory=4
       core_fraction=20
       hdd_size=10
       hdd_type="network-ssd"
       ...
     }
   }
   ```
3. Создайте и используйте отдельную map(object) переменную для блока metadata, она должна быть общая для всех ваших ВМ.
   ```
   пример из terraform.tfvars:
   metadata = {
     serial-port-enable = 1
     ssh-keys           = "ubuntu:ssh-ed25519 AAAAC..."
   }
   ```  
  
5. Найдите и закоментируйте все, более не используемые переменные проекта.
6. Проверьте terraform plan. Изменений быть не должно.


### Решение 6


------

## Дополнительное задание (со звёздочкой*)

**Настоятельно рекомендуем выполнять все задания со звёздочкой.**   
Они помогут глубже разобраться в материале. Задания со звёздочкой дополнительные, не обязательные к выполнению и никак не повлияют на получение вами зачёта по этому домашнему заданию. 


------
### Задание 7*

Изучите содержимое файла console.tf. Откройте terraform console, выполните следующие задания: 

1. Напишите, какой командой можно отобразить **второй** элемент списка test_list.
2. Найдите длину списка test_list с помощью функции length(<имя переменной>).
3. Напишите, какой командой можно отобразить значение ключа admin из map test_map.
4. Напишите interpolation-выражение, результатом которого будет: "John is admin for production server based on OS ubuntu-20-04 with X vcpu, Y ram and Z virtual disks", используйте данные из переменных test_list, test_map, servers и функцию length() для подстановки значений.

**Примечание**: если не догадаетесь как вычленить слово "admin", погуглите: "terraform get keys of map"

В качестве решения предоставьте необходимые команды и их вывод.

------

### Задание 8*
1. Напишите и проверьте переменную test и полное описание ее type в соответствии со значением из terraform.tfvars:
```
test = [
  {
    "dev1" = [
      "ssh -o 'StrictHostKeyChecking=no' ubuntu@62.84.124.117",
      "10.0.1.7",
    ]
  },
  {
    "dev2" = [
      "ssh -o 'StrictHostKeyChecking=no' ubuntu@84.252.140.88",
      "10.0.2.29",
    ]
  },
  {
    "prod1" = [
      "ssh -o 'StrictHostKeyChecking=no' ubuntu@51.250.2.101",
      "10.0.1.30",
    ]
  },
]
```
2. Напишите выражение в terraform console, которое позволит вычленить строку "ssh -o 'StrictHostKeyChecking=no' ubuntu@62.84.124.117" из этой переменной.
------

------

### Задание 9*

Используя инструкцию https://cloud.yandex.ru/ru/docs/vpc/operations/create-nat-gateway#tf_1, настройте для ваших ВМ nat_gateway. Для проверки уберите внешний IP адрес (nat=false) у ваших ВМ и проверьте доступ в интернет с ВМ, подключившись к ней через serial console. Для подключения предварительно через ssh измените пароль пользователя: ```sudo passwd ubuntu```

### Правила приёма работыДля подключения предварительно через ssh измените пароль пользователя: sudo passwd ubuntu
В качестве результата прикрепите ссылку на MD файл с описанием выполненой работы в вашем репозитории. Так же в репозитории должен присутсвовать ваш финальный код проекта.

**Важно. Удалите все созданные ресурсы**.


### Критерии оценки

Зачёт ставится, если:

* выполнены все задания,
* ответы даны в развёрнутой форме,
* приложены соответствующие скриншоты и файлы проекта,
* в выполненных заданиях нет противоречий и нарушения логики.

На доработку работу отправят, если:

* задание выполнено частично или не выполнено вообще,
* в логике выполнения заданий есть противоречия и существенные недостатки. 

