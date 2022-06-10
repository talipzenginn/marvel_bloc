import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/components/dialog/error_dialog.dart';
import '../../../view/home/cubit/home_cubit.dart';
import '../../../core/extension/context_extensions.dart';
import '../../../view/detail/viewmodel/detail_viewmodel.dart';

class LazyListView extends StatefulWidget {
  const LazyListView({
    Key? key,
  }) : super(key: key);
  @override
  State<LazyListView> createState() => _LazyListViewState();
}

class _LazyListViewState extends State<LazyListView> {
  late DetailViewmodel detailViewmodel;
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    detailViewmodel = DetailViewmodel();
    scrollController.addListener(scrollListener);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scrollListener() {
    if (scrollController.offset >=
            scrollController.position.maxScrollExtent / 2 &&
        !scrollController.position.outOfRange) {
      if (context.read<HomeCubit>().hasNext) {
        context.read<HomeCubit>().fetchNextCharacters(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is HomeInitial) {
          context.read<HomeCubit>().fetchNextCharacters(context);
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is HomeError) {
          return ErrorDialog(errorMessage: state.message);
        } else {
          return ListView(
            controller: scrollController,
            padding: context.paddingLowHorizontal,
            children: [
              ...context
                  .read<HomeCubit>()
                  .characters
                  .map(
                    (character) => GestureDetector(
                      onTap: () => context
                          .read<HomeCubit>()
                          .navigateToDetailView(character, detailViewmodel),
                      child: ListTile(
                        title: Text(character.name!),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(character.photoURL!),
                        ),
                      ),
                    ),
                  )
                  .toList(),
              if (context.read<HomeCubit>().hasNext)
                const Center(
                  child: SizedBox(
                    height: 25,
                    width: 25,
                    child: CircularProgressIndicator(),
                  ),
                ),
            ],
          );
        }
      },
    );
  }
}
