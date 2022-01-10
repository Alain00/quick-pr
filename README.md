# quick-pr
Make PRs fast and out of worries, just remember to assing reviewers if needed

## Install

```bash
curl -L https://raw.githubusercontent.com/Alain00/sh-quick-pr/master/install.sh | sh
```
> The script will be installed in zsh if you have .zshrc file in your root folder

## How to use?
Simply execute in a directory with git
```sh
qpr
```

## How it works?
`qpr` will make the PR for you with the help of [github cli](https://cli.github.com/) following the next matchs in order to select the base branch:
<table>
  <thead>
    <tr>
      <th>From</th>
      <th>To</th>
    <tr>
  <thead>
  <tbody>
    <tr>
      <td>staging</td>
      <td>(master, main)</td>
    <tr>
    <tr>
      <td>develop</td>
      <td>staging</td>
    <tr>
    <tr>
      <td>develop</td>
      <td>
        master (in case staging does't exists)
      </td>
    <tr>
    <tr>
      <td>release*</td>
      <td>(master, main)</td>
    </tr>
    <tr>
      <td>*</td>
      <td>develop</td>
    </tr>
    <tr>
      <td>*</td>
      <td>staging</td>
    </tr>
    <tr>
      <td>*</td>
      <td>(master, main)</td>
    </tr>
  </tbody>
</table>

Then it tries to guess the label for the PR from the branch name

<table>
  <thead>
    <tr>
      <th>Branch name</th>
      <th>label</th>
    <tr>
  <thead>
  <tbody>
    <tr>
      <td>feat*</td>
      <td>enhancement</td>
    <tr>
    <tr>
      <td>fix*</td>
      <td>bug</td>
    <tr>
    <tr>
      <td>doc*</td>
      <td>documentation</td>
    <tr>
  </tbody>
</table>