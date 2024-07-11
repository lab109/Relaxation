module relaxation
    use iso_c_binding, only: c_double, c_int
    implicit none

    public::de_dt, vibrational_energy, relaxation_time

contains

!> Вычисление скорости изменения колебательной энергии для молекул
elemental real(kind=c_double) function de_dt(e, e0, ed, tau, thetta, x, dx_dt)
    ! ====================================
    ! Входные данные
    ! ====================================
    real(kind=c_double), intent(in)::e      !< Колебательная энергия молекулы [-]
    real(kind=c_double), intent(in)::e0     !< Равновесная колебательная энергия молекулы [-]
    real(kind=c_double), intent(in)::ed     !< Энергия диссоциации молекулы [K]
    real(kind=c_double), intent(in)::tau    !< Время колебательной релаксации молекулы [с]
    real(kind=c_double), intent(in)::thetta !< Характерестическая колебательная температура [K]
    real(kind=c_double), intent(in)::x      !< Мольные концентрации молекулы [моль/м3]
    real(kind=c_double), intent(in)::dx_dt  !< Изменение мольных концентраций молекулы [моль/м3/с]

    de_dt = (e0 - e) / tau + (ed / thetta) / x * dx_dt
    
end function de_dt

!> Вычисление колебательной энергии
elemental real(kind=c_double) function vibrational_energy(thetta, Tv)
    real(kind=c_double), intent(in)::thetta !< Характеристическая температура [K]
    real(kind=c_double), intent(in)::Tv     !< Поступательная или колебательная температура [K]

    vibrational_energy = 1. / (exp(thetta / Tv) - 1.)

end function vibrational_energy

!> Вычисление времени колебательной релаксации [с]
elemental real(kind=c_double) function relaxation_time(A, B, N, T, P)
    ! ====================================
    ! Входные данные
    ! ====================================
    real(kind=c_double), intent(in)::A  !< Коэффицент уравнения A [?]
    real(kind=c_double), intent(in)::B  !< Коэффициент уравнения B [?]
    real(kind=c_double), intent(in)::N  !< Коэффициент уравнения N [-]
    real(kind=c_double), intent(in)::T  !< Поступательная или колебательная температура [K]
    real(kind=c_double), intent(in)::P  !< Давление [Па]
    ! ====================================
    ! Промежуточные данные
    ! ====================================
    real(kind=c_double), parameter::pa_to_atm = 9.86923266716013E-06    ! Атмосфер в одном паскале
    real(kind=c_double), parameter::mks_to_s = 1e-6                     ! с в мкс
    
    relaxation_time = mks_to_s * A * T**N * exp(B * T**(-1./3.)) / P / pa_to_atm
end function relaxation_time


end module relaxation