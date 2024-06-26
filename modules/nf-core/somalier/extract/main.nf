process SOMALIER_EXTRACT {
    tag "$meta.id"
    label 'process_low'

    container "533267157365.dkr.ecr.eu-west-1.amazonaws.com/somalier:latest"

    input:
    tuple val(meta), path(input), path(input_index)
    path(fasta)
    path(fai)
    path(sites)

    output:
    tuple val(meta), path("*.somalier") , emit: extract
    path "versions.yml"                 , emit: versions

    when:
    task.ext.when == null || task.ext.when

    script:
    def args = task.ext.args ?: ''
    def prefix = task.ext.prefix ?: "${meta.id}"

    """
    somalier extract \\
        --sites ${sites} \\
        -f ${fasta} \\
        ${input} \\
        ${args}

    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        somalier: \$(echo \$(somalier 2>&1) | sed 's/^.*somalier version: //; s/Commands:.*\$//')
    END_VERSIONS
    """

    stub:
    def prefix = task.ext.prefix ?: "${meta.id}"

    """
    touch ${prefix}.somalier

    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        somalier: \$(echo \$(somalier 2>&1) | sed 's/^.*somalier version: //; s/Commands:.*\$//')
    END_VERSIONS
    """
}
