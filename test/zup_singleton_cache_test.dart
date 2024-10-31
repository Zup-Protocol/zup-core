import 'package:clock/clock.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zup_core/zup_core.dart';

void main() {
  tearDown(() => ZupSingletonCache.shared.clear());

  test(
      "When calling singleton cache more than one time, it should return me the first saved result",
      () async {
    const expectedReturn = 432;
    const notExpectedReturn = 123;
    const key = "dale";

    await ZupSingletonCache.shared.run(
      () async {
        return expectedReturn;
      },
      key: key,
    );

    expect(
        await ZupSingletonCache.shared.run(
          () async {
            return notExpectedReturn;
          },
          key: key,
        ),
        expectedReturn);
  });

  test(
      "when passing a expiration time to run, and it passes the expiration time, it should call the action again",
      () async {
    const expectedReturn = 432;
    const notExpectedReturn = 427871;
    const key = "dale-14343";

    await ZupSingletonCache.shared.run(
      () async {
        return notExpectedReturn;
      },
      key: key,
    );

    await withClock(
        Clock(
          () => DateTime.now().toUtc().add(const Duration(minutes: 20)),
        ), () async {
      expect(
          await ZupSingletonCache.shared.run(
            () async {
              return expectedReturn;
            },
            key: key,
            expiration: const Duration(minutes: 10),
          ),
          expectedReturn);
    });
  });

  test(
      "when passing a expiration time to run, but the action did not pass the expiration time, it should not call the action again",
      () async {
    const expectedReturn = 432;
    const notExpectedReturn = 427871;
    const key = "dale-14343";

    await ZupSingletonCache.shared.run(
      () async {
        return expectedReturn;
      },
      key: key,
    );

    await withClock(
        Clock(
          () => DateTime.now().toUtc().add(const Duration(minutes: 5)),
        ), () async {
      expect(
          await ZupSingletonCache.shared.run(
            () async {
              return notExpectedReturn;
            },
            key: key,
            expiration: const Duration(minutes: 10),
          ),
          expectedReturn);
    });
  });

  test(
      "If ignoreCache is true, it should execute the action always, but still save the result",
      () async {
    const expectedReturn = 432;
    const notExpectedReturn = 427871;
    const notExpectedReturn2 = 26876278;
    const key = "dale-14343";

    await ZupSingletonCache.shared.run(
      () async {
        return notExpectedReturn;
      },
      key: key,
      ignoreCache: true,
    );

    await ZupSingletonCache.shared.run(
      () async {
        return notExpectedReturn2;
      },
      key: key,
      ignoreCache: true,
    );

    expect(
        await ZupSingletonCache.shared.run(
          () async {
            return expectedReturn;
          },
          key: key,
          ignoreCache: true,
        ),
        expectedReturn);
  });
}
