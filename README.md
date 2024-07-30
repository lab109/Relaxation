# Расчет параметром колебательной релаксации

## Как добавить в проект?

```sh
git submodule add https://github.com/lab109/Relaxation.git
```

или

```sh
git submodule add git@github.com:lab109/Relaxation.git
```

В cmake проекте прописать

```cmake
set(CMAKE_Fortran_MODULE_DIRECTORY ${CMAKE_BINARY_DIR}/fortran_modules)

target_include_directories(project_name PRIVATE ${CMAKE_CURRENT_BINARY_DIR}/fortran_modules)
...
add_subdirectory(Relaxation)
...
target_link_libraries(project_name PRIVATE lab109::relaxation)
```

## Как пользоваться?

Функция `de_dt` вычисляет значение скорости изменения колебательной энергии.

Входные данные:

```Fortran
real(kind=c_double), intent(in)::e      !< Колебательная энергия молекулы [-]
real(kind=c_double), intent(in)::e0     !< Равновесная колебательная энергия молекулы [-]
real(kind=c_double), intent(in)::ed     !< Энергия диссоциации молекулы [K]
real(kind=c_double), intent(in)::tau    !< Время колебательной релаксации молекулы [с]
real(kind=c_double), intent(in)::thetta !< Характерестическая колебательная температура [K]
real(kind=c_double), intent(in)::x      !< Мольные концентрации молекулы [моль/м3]
real(kind=c_double), intent(in)::dx_dt  !< Изменение мольных концентраций молекулы [моль/м3/с]
```

Функция `vibrational_energy` вычисляет значение колебательной энергии.

Входные данные:

```Fortran
real(kind=c_double), intent(in)::thetta !< Характеристическая температура [K]
real(kind=c_double), intent(in)::Tv     !< Поступательная или колебательная температура [K]
```

Функция `relaxation_time` вычисляет значение времени колебательной релаксации между частицами двух сортов.

Входные данные:

```Fortran
real(kind=c_double), intent(in)::A  !< Коэффицент уравнения A [?]
real(kind=c_double), intent(in)::B  !< Коэффициент уравнения B [?]
real(kind=c_double), intent(in)::N  !< Коэффициент уравнения N [-]
real(kind=c_double), intent(in)::T  !< Поступательная или колебательная температура [K]
real(kind=c_double), intent(in)::P  !< Давление [Па]
```
