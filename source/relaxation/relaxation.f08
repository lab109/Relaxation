module relaxation
   use iso_c_binding, only: c_double
   implicit none

   public::de_dt, vibrational_energy, relaxation_time

contains

   !> Вычисление скорости изменения колебательной энергии для молекул
   pure real(kind=c_double) function de_dt(e, e0, ed, tau, thetta, x, dx_dt) bind(C, name="relaxations_de_dt")
      ! ====================================
      ! Входные данные
      ! ====================================
      real(kind=c_double), intent(in), value::e      !< Колебательная энергия молекулы [-]
      real(kind=c_double), intent(in), value::e0     !< Равновесная колебательная энергия молекулы [-]
      real(kind=c_double), intent(in), value::ed     !< Энергия диссоциации молекулы [K]
      real(kind=c_double), intent(in), value::tau    !< Время колебательной релаксации молекулы [с]
      real(kind=c_double), intent(in), value::thetta !< Характерестическая колебательная температура [K]
      real(kind=c_double), intent(in), value::x      !< Мольные концентрации молекулы [моль/м3]
      real(kind=c_double), intent(in), value::dx_dt  !< Изменение мольных концентраций молекулы [моль/м3/с]

      de_dt = (e0 - e)/tau + (ed/thetta)/x*dx_dt

   end function de_dt

   !> Вычисление колебательной энергии
   pure real(kind=c_double) function vibrational_energy(thetta, Tv) bind(C, name="relaxations_vibrational_energy")
      real(kind=c_double), intent(in), value::thetta !< Характеристическая температура [K]
      real(kind=c_double), intent(in), value::Tv     !< Поступательная или колебательная температура [K]

      vibrational_energy = 1.d0/(exp(thetta/Tv) - 1.d0)

   end function vibrational_energy

   !> Вычисление времени колебательной релаксации [с]
   pure real(kind=c_double) function relaxation_time(A, B, N, T, P) bind(C, name="relaxations_relaxation_time")
      ! ====================================
      ! Входные данные
      ! ====================================
      real(kind=c_double), intent(in), value::A  !< Коэффицент уравнения A [?]
      real(kind=c_double), intent(in), value::B  !< Коэффициент уравнения B [?]
      real(kind=c_double), intent(in), value::N  !< Коэффициент уравнения N [-]
      real(kind=c_double), intent(in), value::T  !< Поступательная или колебательная температура [K]
      real(kind=c_double), intent(in), value::P  !< Давление [Па]
      ! ====================================
      ! Промежуточные данные
      ! ====================================
      real(kind=c_double), parameter::pa_to_atm = 9.86923266716013E-06     !& Атмосфер в одном паскале
      real(kind=c_double), parameter::mks_to_s  = 1e-6                     !& с в мкс

      relaxation_time = mks_to_s*A*T**N*exp(B*T**(1.d0/3.d0))/P/pa_to_atm
   end function relaxation_time

end module relaxation
