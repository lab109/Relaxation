#ifndef LAB109_RELAXATION_H__
#define LAB109_RELAXATION_H__
#ifdef __cplusplus
extern "C" {
#endif

extern double relaxations_de_dt(
    double e, double e0, double ed, double tau, double thetta, double x, double dx_dt);

extern double relaxations_vibrational_energy(double thetta, double Tv);

extern double relaxations_relaxation_time(double A, double B, double N, double T, double P);

#ifdef __cplusplus
}
#endif
#endif  // LAB109_RELAXATION_H__