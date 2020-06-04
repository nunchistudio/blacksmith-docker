# Contributing to Blacksmith

We are incredibly thankful for the contributions we can receive from the community.

## Reporting security issues

We deeply appreciate any effort to discover and disclose security vulnerabilities
responsibly.

If you would like to report a vulnerability in one of our products, please send
us an e-mail at <security@nunchi.studio> but **do not file a public issue**.

We take all disclosures very seriously and will do our best to rapidly respond and
verify the vulnerability before taking the necessary steps to fix it. After our
initial reply to your disclosure, which should be directly after receiving it, we
will periodically update you with the status of the fix.

## Contribution Guidelines

Since we want to involve our community as much as possible, we try to keep
contribution guidelines as light but rock-solid as possible.

- Your pull request targets the `development` branch and is up-to-date with this
  branch.
- Commit messages and pull requests must respect the
  [Conventional Commits Specification](https://www.conventionalcommits.org/).
  The types and scopes to follow can be found on the
  [`semantic.yml` file](https://github.com/nunchistudio/blacksmith-docker/blob/master/.github/semantic.yml).
- You sign every Git commits using your real name and real email address. If you
  set your `user.name` and `user.email` git configs, you can sign your commit
  automatically using `git commit -s`. Example:
  ```bash
  $ git commit -s -am "feat(store): Add Delete() method"
  ```
- You agree to both the product license and the Developer Certificate of Origin
  as defined in Exhibit A.

## Building and publishing the Docker images

Here are snippets to help you build and publish the Docker images. Since the `buster`
tag is the default one, we also need to tag it without any tag.

Shortcuts to `build` and `push` are available in the `Makefile` of this repository.

### For `alpine` distribution

Build the image:
```bash
$ docker build -f ./Dockerfile-alpine \
  -t nunchistudio/blacksmith:<version>-alpine .
```

Publish the image on the Docker Hub:
```bash
$ docker push nunchistudio/blacksmith:<version>-alpine
```

### For `buster` distribution

Build the image:
```bash
$ docker build -f ./Dockerfile-buster \
  -t nunchistudio/blacksmith:<version>-buster \
  -t nunchistudio/blacksmith:<version> .
```

Publish the image on the Docker Hub:
```bash
$ docker push nunchistudio/blacksmith:<version>-buster
$ docker push nunchistudio/blacksmith:<version>
```

### For `stretch` distribution

Build the image:
```bash
$ docker build -f ./Dockerfile-stretch \
  -t nunchistudio/blacksmith:<version>-stretch .
```

Publish the image on the Docker Hub:
```bash
$ docker push nunchistudio/blacksmith:<version>-stretch
```

## Exhibit A - Developer Certificate of Origin

    By making a contribution to this project, I certify that:

    (a) The contribution was created in whole or in part by me and I have the right
        to submit it under the open source license indicated in the file; or

    (b) The contribution is based upon previous work that, to the best of my knowledge,
        is covered under an appropriate open source license and I have the right under
        that license to submit that work with modifications, whether created in whole
        or in part by me, under the same open source license (unless I am permitted
        to submit under a different license), as indicated in the file; or

    (c) The contribution was provided directly to me by some other person who certified
        (a), (b) or (c) and I have not modified it.

    (d) I understand and agree that this project and the contribution are public and
        that a record of the contribution (including all personal information I submit
        with it, including my sign-off) is maintained indefinitely and may be redistributed
        consistent with this project or the open source license(s) involved.
