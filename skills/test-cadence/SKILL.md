---
name: test-cadence
description: When and how much to test, and how to claim results. Use before running tests, before committing, before a big test run, and before reporting any measurement.
---
# Test cadence

## 1. Cadence
**Why:** running over a thousand overlapping tests in every phase, three suites in parallel, cost hours of machine time and a large share of the usage budget without finding more bugs.
1. **Inside a step (agent):** only the new tests of the step, plus at most one or two old files the code touches directly. Within the cap in the brief. Never "re-run the old broad suites".
2. **Before a commit (lead, once per round):** the latest spec's tests plus a small critical set (new security/no-leak tests, isolation and route classification, login, schema checks for new migrations, contract tests in default mode). Not the whole suite.
3. **Full suite:** once, by the lead, at the end of the programme or a wave, or before handing to a customer. Never at the end of every round.
4. **A pass with skips is not a pass.** Missing the test database variable silently runs on a weaker backend and skips many tests; check the counts.
5. **Before a very large run:** tell the owner first. Agree what must be closed, what database settings he may relax for speed (and that they must be restored afterwards), checkpoint the run with a suffix so a crash resumes instead of restarting, and cap parallel runs (about three). After the run, remind him to restore the settings and confirm they are back.
6. Parallel agents must not run tests that share fixed database names, ports or temp folders; give each its own names or serialise.

## 2. Measure before claiming
**Why:** in one session six confident claims turned out wrong (a sample was the first rows of a date-sorted list, a number came from a single run of a random process, a percentage was computed against the wrong base). Each wrong claim directed spending; the owner pays.
- **Write the success criterion before the run** (metric, threshold, dataset), each item PASS or FAIL.
- **Look at the actual output** (open the file, read the text) before trusting a metric. Detectors can report "fine" on broken output.
- **A sample spread across the range** is a sample; the first N rows of a sorted list is not.
- **Hold variables fixed** when comparing two things; do not compare two settings that changed together.
- **Random processes need at least two runs** before a number is stated.
- **Start with one item**, not twelve; an untested long job can burn hours silently.
- **A shocking number: assume the metric is wrong** and check it before raising an alarm.
- **When you fix a metric, re-check every threshold calibrated on the broken one;** a threshold tuned to a wrong metric fails when the metric is corrected.
- Never raise or bend a threshold to make a criterion pass; report FAIL.
- Report what was and was not measured, with numbers.

## 3. Failure handling
A failing test is reported with its output. After 3 failed attempts on the same failure: stop, report, hand back to the lead, who redirects before the agent invents something.
