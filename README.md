
 
 ```
 
 lib--
    | --- bindings 
    | --- core 
        | --- entity
        | --- theme
        | --- utils
        | --- common_widgets
        | --- ...
    | --- services
        | --- network
        | --- storage
        | --- ...
    | --- modules
        | --- feature1
            | --- data
                | --- mappers
                | --- dtos
                | --- datasource
                | --- repositories (implement)
            | --- domain
                | --- entities
                | --- repositories (interface)
                | --- usecases
            | --- presentation
                | --- screen1
                    | --- bloc/cubit
                    | --- widgets
                | --- screen2
                    | --- bloc/cubit
                    | --- widgets
    | --- router
 ```

1.  lib\bindings: // Khai báo Dependency Injection 

2. lib\core: Khai báo những tài nguyên sử dụng cho app. Ví dụ:

- entity: Khai báo những entity được sử dụng chung cho app.
- theme: Khai báo app_themes, app_colors, app_typography...
- common_widgets: Khai báo những widget được tái sử dụng cho app.

3. lib\network: Khai báo xử lý liên quan tới dio ( xử lý Interceptors,...)
4. lib\modules: 
![image](https://github.com/clipcrow/saludi-lifestyle-related-diseases/assets/111418581/cfcc9a0c-e402-48d4-b630-18ea42bfffd7)


4.1 data layer: 

![image](https://github.com/clipcrow/saludi-lifestyle-related-diseases/assets/111418581/99848ff3-efe6-476f-87ed-6fe9f686a90c) 
Lớp này xử lý truy xuất dữ liệu từ nhiều nguồn. Sẽ bao gồm một repository class, nó implements domain và xác định xem nên trả về dữ liệu mới hay dữ liệu được lưu trong bộ nhớ đệm cũng như thời điểm lưu dữ liệu đó vào bộ nhớ đệm. Ngoài ra, lớp nguồn dữ liệu xử lý dữ liệu từ một nguồn cụ thể, thường là API hoặc local database.

+ datasource:  Xử lý get dữ liệu từ API hoặc local
+ repositories (implement): Implement repository interface 

4.2 domain layer:  

Tầng trung gian giữa data layer và presentation layer
+ repositories (interface): Khai báo interface
+ UseCases: xử lý business logic.

4.3 presentation layer:  Xử lý render layout.

5. lib/router: Handle router và navigation cho app.
