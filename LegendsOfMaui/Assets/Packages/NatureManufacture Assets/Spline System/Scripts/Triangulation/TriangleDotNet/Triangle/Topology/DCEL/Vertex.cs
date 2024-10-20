﻿// -----------------------------------------------------------------------
// <copyright file="Vertex.cs">
// Triangle.NET code by Christian Woltering, http://triangle.codeplex.com/
// </copyright>
// -----------------------------------------------------------------------

using System.Collections.Generic;
using TriangleNet.Geometry;

namespace TriangleNet.Topology.DCEL
{
    public class Vertex : Point
    {
        internal HalfEdge leaving;

        /// <summary>
        ///     Initializes a new instance of the <see cref="Vertex" /> class.
        /// </summary>
        /// <param name="x">The x coordinate.</param>
        /// <param name="y">The y coordinate.</param>
        public Vertex(double x, double y)
            : base(x, y)
        {
        }

        /// <summary>
        ///     Initializes a new instance of the <see cref="Vertex" /> class.
        /// </summary>
        /// <param name="x">The x coordinate.</param>
        /// <param name="y">The y coordinate.</param>
        /// <param name="leaving">A half-edge leaving this vertex.</param>
        public Vertex(double x, double y, HalfEdge leaving)
            : base(x, y)
        {
            this.leaving = leaving;
        }

        /// <summary>
        ///     Gets or sets a half-edge leaving the vertex.
        /// </summary>
        public HalfEdge Leaving
        {
            get => leaving;
            set => leaving = value;
        }

        /// <summary>
        ///     Enumerates all half-edges leaving this vertex.
        /// </summary>
        /// <returns></returns>
        public IEnumerable<HalfEdge> EnumerateEdges()
        {
            HalfEdge edge = Leaving;
            int first = edge.ID;

            do
            {
                yield return edge;

                edge = edge.Twin.Next;
            } while (edge.ID != first);
        }

        public override string ToString()
        {
            return string.Format("V-ID {0}", id);
        }
    }
}