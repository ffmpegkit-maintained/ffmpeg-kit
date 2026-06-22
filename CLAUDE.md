# Instructions pour ce projet (ffmpeg-kit)

- Dorénavant, chaque fois que c'est nécessaire (nouvelle version, fix, changement de palier/tier), prends en charge toi-même la mise à jour sur **Maven Central** et sur **Gumroad** sans attendre qu'on te le demande explicitement à chaque fois.
- Toute publication réelle vers Maven Central (tag `v*-free`) est permanente — informe l'utilisateur avant de pousser ce genre de tag, mais procède avec ton meilleur jugement si le contexte indique que c'est attendu.

## Les 4 paliers et comment les publier

| Palier | Prix | Workflow CI | Tag déclencheur | Distribution |
|---|---|---|---|---|
| Free | $0 | `build-free.yml` | `v*-free` (ex: `v6.0.1-free`) | Maven Central, `dev.ffmpegkit-maintained:ffmpeg-kit-free` |
| Basic | $19 / $49 (team) | `build-basic.yml` | `v*-basic` | Gumroad (produit à créer, voir tâche #16) |
| Full | $29 / $75 (team) | `build.yml` | `v*` (sans suffixe) | Gumroad produit `xzuhjx` |
| Full GPL | $39 / $99 (team) | `build-gpl.yml` | `v*-gpl` | Gumroad (produit à créer, voir tâche #17) |

**Pour publier une nouvelle version d'un palier :**
1. Pousser le tag correspondant (`git tag vX.Y.Z-<suffixe> && git push origin vX.Y.Z-<suffixe>`) — déclenche le build CI.
2. Pour Free : si le build + 16KB alignment passent, l'étape "Publish to Maven Central" se déclenche automatiquement (gated sur `startsWith(github.ref, 'refs/tags/')`). Rien d'autre à faire.
3. Pour Basic/Full/Full GPL : une fois le run vert, télécharger l'artifact (`gh run download <run_id>`) puis mettre à jour le fichier sur le produit Gumroad concerné via la CLI `gumroad` (déjà installée/authentifiée) : `gumroad products update <product_id> --file <chemin.aar>`. Attention : `--file` AJOUTE un fichier plutôt que de remplacer — retirer l'ancien manuellement via le dashboard si besoin (pas de primitive CLI propre pour ça).

## Secrets déjà configurés sur le repo GitHub

`OSSRH_USERNAME`, `OSSRH_PASSWORD` (token Sonatype), `GPG_PRIVATE_KEY`, `GPG_PASSPHRASE` (clé GPG ID court `15567C31`, ID long `092C1CFA15567C31`) — utilisés par `build-free.yml` pour signer/publier sur Maven Central. Ne jamais redemander/régénérer ces secrets sans raison — ils sont déjà en place.

## Gumroad

- Produit existant `xzuhjx` = palier **Full**, actuellement encore à l'ancien prix $19/$49 (tâche #15 : repricer vers $29/$75).
- Variante de prix gérée via `gumroad variant-categories list --product <id>` puis `gumroad variants update <variant_id> --product <id> --category <cat_id> --price-difference <montant>`.
- Page Full GPL : toujours inclure l'indicateur visuel ⚠️ pour la licence GPL-3.0 (demande explicite de l'utilisateur).
