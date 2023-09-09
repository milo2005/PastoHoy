import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pasto_hoy/domain/plans/usecases/listen_plans_use_case.dart';
import 'package:pasto_hoy/presentation/pages/plans/plans_state.dart';

import '../../../domain/plans/usecases/refresh_list_plans.dart';

@injectable
class PlansBloc extends Cubit<PlanState> {
  final ListenPlansUseCase _listenPlanUseCase;
  final RefreshPlansUseCase _refreshPlansUseCase;

  StreamSubscription? _subscription;

  PlansBloc(this._listenPlanUseCase, this._refreshPlansUseCase):super(PlanStateLoading()) {
    _listenPlans();
  }

  _listenPlans() {
    _subscription = _listenPlanUseCase()
        .listen((event) => emit(PlanStateContent(event)));
  }

  refreshInfo() {
    _refreshPlansUseCase();
  }

  dispose(){
    _subscription?.cancel();
  }



}