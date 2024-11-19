# Github Controls, Prototype Demo

Demonstrates controls related to Branches, PRs, and versioning using github actions.

- you'll  need the git utilities in your PATH, https://github.com/jimweller/git-utils
- for later, GIT_* env vars https://stackoverflow.com/questions/76314852/semantic-release-always-uses-semantic-release-bot-user-instead-of-own-for-git-co

## Conventional Commits and `commitlint`

Commit messages should follow [conventional
commit](https://www.conventionalcommits.org/en/v1.0.0/#summary) standards. You can see the
rules set in `.commitlintrc.json`. You can see examples of a violation of each
rule in `tests/commit.yml`. You can run the the test harness by installing
commitlint, going  into the `tests` directory and running `./commits.sh`.

Example Output

```bash
-- TEST COMMIT MEASSAGE --------------------------------------------------------

chore: the subject and body are missing a blank line in between

blank line after this
BREAKING CHANGE BLANK LINE BEFORE THIS

-- COMMITLINT OUTPUT -----------------------------------------------------------
⧗   input: chore: the subject and body are missing a blank line in between

blank line after this

BREAKING CHANGE BLANK LINE BEFORE THIS
✖   footer must have leading blank line [footer-leading-blank]

✖   found 1 problems, 0 warnings
ⓘ   Get help: https://github.com/conventional-changelog/commitlint/#what-is-commitlint

********************************************************************************

-- TEST NAME -------------------------------------------------------------------

valid commit message

-- TEST COMMIT MEASSAGE --------------------------------------------------------

chore: this is a valid commit subject

this is a valid commit body

BREAKING CHANGE IS A VALID FOOTER

-- COMMITLINT OUTPUT -----------------------------------------------------------
********************************************************************************
```
